create table [Genres]
(
	[GenreID] int primary key not null identity,
	[GenreName] nvarchar(50) not null
)
go

create table [MovieGenres]
(
	[MovieID] int not null,
	[GenreID] int not null
)
go

create table [Movies]
(
	[MovieID] int primary key not null identity,
	[DirectorID] int not null,
	[Title] nvarchar(50) not null check(Title != N''),
	[ReleaseYear] date not null,
	[Rating] float not null,
	[Plot] nvarchar(max) not null,
	[MovieLength] float not null
)
go

create table [Directors]
(
	[DirectorID] int primary key not null identity,
	[FirstName] nvarchar(50) not null,
	[LastName] nvarchar(50) not null,
	[Nationality] nvarchar(50) not null,
	[Birth] date not null
)
go

create table [MovieActor]
(
	[MovieID] int not null,
	[ActorID] int not null
)
go

create table [Actors]
(
	[ActorID] int primary key not null identity,
	[FirstName] nvarchar(50) not null,
	[LastName] nvarchar(50) not null,
	[Nationality] nvarchar(50) not null,
	[Birth] date not null
)
go

alter table [MovieGenres]
add constraint [GenreFK]
foreign key([GenreID]) references Genres([GenreID])
go

alter table [MovieGenres]
add constraint [MovieFK]
foreign key([MovieID]) references Movies([MovieID])
go

alter table [MovieActor]
add constraint [MovieActorFK]
foreign key([MovieID]) references Movies([MovieID])
go

alter table [MovieActor]
add constraint [ActorFK]
foreign key([ActorID]) references Actors([ActorID])
go

alter table [Movies]
add constraint [DirecotrFK]
foreign key([DirectorID]) references Directors([DirectorID])
go


