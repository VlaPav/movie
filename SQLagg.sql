use [Movies]
--1
select [ReleaseYear] as [Release year], 
COUNT([Title]) as [Count]
from [Movies]
group by [ReleaseYear]
--2
select distinct [Title] as [Movie name]
from [Movies]
where [Rating] = (select max([Rating]) from [Movies])
--3
select distinct [Title] as [Movie name], [Rating] as [Rating]
from [Movies]
where [Rating] >= (select AVG([Rating]) from [Movies])
--4
select distinct [Title] as [Movie name]
from [Movies]
where YEAR([ReleaseYear]) = YEAR(GETDATE())-1
--5
select distinct g.[GenreName] as [Genre name],
(select COUNT([MovieID]) from [MovieGenres] where [GenreID] = g.[GenreID]) as [Movies count]
from [MovieGenres] mg, [Genres] g
--6
select distinct a.[FirstName] as [Actor name],a.[LastName] as [Actor lastname],
(select COUNT([MovieID]) from [MovieActor] where [ActorID] = mc.[ActorID]) as [Movies count]
from [MovieActor] mc, [Actors] a
--7
select d.[FirstName], d.[LastName], m.[Title], m.[Rating]
from [Directors] d, [Movies] m
where d.[DirectorID] = m.[DirectorID] and m.[Rating] =(select max([Rating]) from [Movies])
