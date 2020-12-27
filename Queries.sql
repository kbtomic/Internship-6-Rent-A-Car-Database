--Dohvatiti sva vozila kojima je istekla registracija
select v.Id, v.Color, v.Mileage, v.Registration, b.BrandName, m.ModelName, r.RegistrationDate
from Vehicles v
join Registrations r
on r.Id = (select top 1 r2.Id from Registrations r2 where r2.VehicleId = v.Id order by r2.RegistrationDate desc)
join Models m on m.Id = v.ModelId
join Brands b on b.Id = m.BrandId
join TypesOfVehicles tv on tv.Id = m.TypeOfVehicleId
where DATEADD(YEAR, 1, RegistrationDate) < GETDATE()

--Dohvatiti sva vozila kojima registracija istièe unutar iduæih mjesec dana
select v.Id, v.Color, v.Mileage, v.Registration, b.BrandName, m.ModelName, r.RegistrationDate
from Vehicles v
join Registrations r
on r.Id = (select top 1 r2.Id from Registrations r2 where r2.VehicleId = v.Id order by r2.RegistrationDate desc)
join Models m on m.Id = v.ModelId
join Brands b on b.Id = m.BrandId
join TypesOfVehicles tv on tv.Id = m.TypeOfVehicleId
where DATEADD(YEAR, 1, RegistrationDate) BETWEEN GETDATE() AND DATEADD(MONTH, 1, GETDATE())

--dohvatiti koliko vozila postoji po vrsti
select tv.TypeOfVehicle, COUNT(v.Id) AS NumberOfVehicles from Vehicles v
join Models m on m.Id = v.ModelId
join TypesOfVehicles tv on tv.Id = m.TypeOfVehicleId
GROUP BY TypeOfVehicle
ORDER BY NumberOfVehicles desc

--dohvatiti zadnjih 5 najmova koje je ostvario odredeni zaposlenik
select top(5) e.FirstName, e.LastName, r.*
from Rents r
join Employees e on e.Id = r.EmployeeId
where r.EmployeeId = 1
ORDER BY r.StartTime desc

--izracunati ukupnu cijenu najma za odredeni najam
CREATE FUNCTION CalculatePriceOfRent(@StartTime as datetime2, @Duration as float, @SummerPrice as int, @WinterPrice as int)
RETURNS int
AS
BEGIN
	DECLARE @Price int = 0;
	WHILE @Duration>0
	BEGIN
		IF DATEPART(MONTH, @STARTTIME) BETWEEN 3 AND 9 OR (DATEPART(MONTH, @STARTTIME) = 10 AND DATEPART(DAY, @STARTTIME) = 1)
		BEGIN
			SET @Price += 0.5*@SummerPrice;
		END
		ELSE 
		BEGIN
			SET @Price += 0.5*@WinterPrice;
		END
		SET @StartTime = DATEADD(HOUR, 12, @StartTime);
		SET @Duration-=0.5;
	END
RETURN @Price
END

select r.Id, r.StartTime, r.Duration, c.ClassSummerPrice, c.ClassWinterPrice,
dbo.CalculatePriceOfRent(r.StartTime, r.Duration, c.ClassSummerPrice, c.ClassWinterPrice) as Price
from Rents r
join Vehicles v on v.Id = r.VehicleId
join Models m on m.Id = v.ModelId
join Classes c on c.Id = m.ClassId
where r.Id = 1

--dohvatiti sve kupce najmova ikad, ne ponavljaju se u rezultatima
select distinct(r.BuyerOib), r.BuyerFirstName, r.BuyerLastName
from Rents r

--dohvatiti za svakog zaposlenika timestamp zadnjeg najma koji je ostvario
select e.Id, MAX(r.StartTime) AS LastRentDate
from Rents r
join Employees e on e.Id = r.EmployeeId
GROUP BY e.Id
ORDER BY e.Id

--dohvatiti broj vozila svake marke koju rent-a-car ima
select b.BrandName, COUNT(v.Id) AS NumberOfVehicles from Vehicles v
join Models m on m.Id = v.ModelId
join Brands b on b.Id = m.BrandId
GROUP BY b.BrandName
ORDER BY NumberOfVehicles desc

--Arhivirati sve najmove koji su završili u novu tablicu. Osim veæ postojeæih podataka u najmu, arhivirana tablica æe sadržavati i podatak koliko je taj najam kostao
select r.*,
dbo.CalculatePriceOfRent(r.StartTime, r.Duration, c.ClassSummerPrice, c.ClassWinterPrice) as Price
into ArchivedRents from Rents r
join Vehicles v on v.Id = r.VehicleId
join Models m on m.Id = v.ModelId
join Classes c on c.Id = m.ClassId
where (DATEADD(HOUR, r.Duration * 24, r.StartTime) < GETDATE())

-- izbrisi na kraju da mozes provjerit ostatak zahtjeva
delete from Rents where (DATEADD(HOUR, Rents.Duration * 24, Rents.StartTime) < GETDATE())
--
select * from ArchivedRents
select * from Rents

--pobrojati koliko je najmova bilo po mjesecu, u svakom mjesecu 2020.godine
;WITH Months(Month) AS
(
  SELECT 1 UNION ALL SELECT Month+1 FROM Months WHERE Month <= 11
)
SELECT m.Month, COUNT(r.Id) AS NumberOfRentsInMonth
FROM Months AS m
LEFT OUTER JOIN Rents r
ON m.Month = MONTH(r.StartTime)
AND YEAR(r.StartTime) = 2020
GROUP BY m.Month
ORDER BY m.Month

--Za sva vozila odreðene vrste, osim informaciju o vozilu, ispisati tekstualnu informaciju treba li registrirati vozilo unutar iduæih mjesec dana (‘Treba registraciju’, ‘Ne treba registraciju’)
select v.Id, v.Color, v.Mileage, v.Registration, b.BrandName, m.ModelName, r.RegistrationDate,
case
	when DATEADD(YEAR, 1, RegistrationDate) BETWEEN GETDATE() AND DATEADD(MONTH, 1, GETDATE()) then 'Treba registraciju'
	else 'Ne treba registraciju'
end as NeedToBeRegistrated
from Vehicles v
join Registrations r
on r.Id = (select top 1 r2.Id from Registrations r2 where r2.VehicleId = v.Id order by r2.RegistrationDate desc)
join Models m on m.Id = v.ModelId
join Brands b on b.Id = m.BrandId
join TypesOfVehicles tv on tv.Id = m.TypeOfVehicleId
where tv.Id = 2

--dohvatiti broj najmova po vrsti vozila cija duljina najma prelazi prosjecnu duljinu najma
select tv.TypeOfVehicle, COUNT(r.Id) AS NumberOfRents from Rents r
join Vehicles v on v.Id = r.VehicleId
join Models m on m.Id = v.ModelId
join TypesOfVehicles tv on tv.Id = m.TypeOfVehicleId
where r.Duration > (select AVG(r.Duration) from Rents r)
GROUP BY TypeOfVehicle
ORDER BY NumberOfRents desc



