CREATE DOMAIN identify
 AS INTEGER;

CREATE DOMAIN name_custom
 AS VARCHAR(30);

-- CREATE DOMAIN date_a
-- AS DATE
-- CHECK (date_d > date_a);
--
-- CREATE DOMAIN date_d
-- AS DATE
-- CHECK (date_d > date_a);

CREATE TABLE Routes(
	ID_route SERIAL NOT NULL,
	Region  name_custom NULL,
	City    name_custom NULL
);

CREATE TABLE Stations(
	ID_station SERIAL NOT NULL,
	Name_station name_custom NULL,
  ID_route identify NULL
);

CREATE TABLE FlightStation(
  ID_flight identify NULL,
  ID_station identify NULL,
	date_arrive TIMESTAMP NULL, --Время прибытия
	date_departure TIMESTAMP NULL,  --Время отправления
  sort_order identify NULL
);

CREATE TABLE Stops(
	ID_stop SERIAL NOT NULL,
	ID_train identify NULL,
	ID_station identify NULL,
	date_arrive time NULL, --Время прибытия
	date_departure time NULL,  --Время отправления
	day_from_departure identify NULL,
	transit BOOLEAN NULL,
	sort_order identify NULL
);


CREATE TABLE Flights(
	ID_flight SERIAL NOT NULL,
	ID_train identify NULL,
	date_start date NULL
);

CREATE TABLE Tickets (
	ID_ticket SERIAL NOT NULL,
	ID_place identify NULL,
	ID_flight identify NULL,
	ID_station identify NULL,
	Stat_ID_station identify NULL,
	date_arrival DATE NULL, -- Генерирует приложение
	date_dispatch DATE NULL, -- Генерирует приложение
	passport_number INTEGER NULL,
	full_name VARCHAR(80) NULL
);

CREATE TABLE Places(
	ID_place SERIAL NOT NULL,
	ID_carriage identify NULL,
	place identify NULL
);

CREATE TABLE Carriages(
	ID_carriage SERIAL NOT NULL,
	ID_flight identify NULL,
	carriage identify NULL
);

CREATE TABLE Trains(
	ID_train SERIAL NOT NULL,
	train_number identify NULL
);

ALTER TABLE Stations ADD CONSTRAINT PK_stations PRIMARY KEY (ID_station);
ALTER TABLE Stops ADD CONSTRAINT PK_stops PRIMARY KEY (ID_stop);
ALTER TABLE Routes ADD CONSTRAINT PK_routes PRIMARY KEY (ID_route);
ALTER TABLE Flights ADD CONSTRAINT PK_flights PRIMARY KEY (ID_flight);
ALTER TABLE Tickets ADD CONSTRAINT PK_tickets PRIMARY KEY (ID_ticket);
ALTER TABLE Places ADD CONSTRAINT PK_places PRIMARY KEY (ID_place);
ALTER TABLE Carriages ADD CONSTRAINT PK_carriages PRIMARY KEY (ID_carriage);
ALTER TABLE Trains ADD CONSTRAINT PK_trains PRIMARY KEY (ID_train);


ALTER TABLE Stations ADD CONSTRAINT FK_stations_route FOREIGN KEY (ID_route) REFERENCES Routes (ID_route) ON DELETE CASCADE;
-- -------------------------------
ALTER TABLE Stops ADD CONSTRAINT FK_stops_train FOREIGN KEY (ID_train) REFERENCES Trains(ID_train);
ALTER TABLE Stops ADD CONSTRAINT FK_stops_station FOREIGN KEY (ID_station) REFERENCES Stations(ID_station);
-- ----------------------------------------------
ALTER TABLE Flights ADD CONSTRAINT FK_flights_train FOREIGN KEY (ID_train) REFERENCES Trains (ID_train);
-- ------------------------------------------------
ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_place FOREIGN KEY (ID_place) REFERENCES Places (ID_place) ON DELETE SET NULL;
ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_flight FOREIGN KEY (ID_flight) REFERENCES Flights (ID_flight);
ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_station FOREIGN KEY (ID_station) REFERENCES Stations (ID_station) ON DELETE SET NULL;
ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_station_dep FOREIGN KEY (Stat_ID_station) REFERENCES Stations (ID_station) ON DELETE SET NULL;
--------------------------------------------------
ALTER TABLE Places ADD CONSTRAINT FK_places_carriage FOREIGN KEY (ID_carriage) REFERENCES Carriages (ID_carriage) ON DELETE CASCADE;
-----------------------------------------------
ALTER TABLE Carriages ADD CONSTRAINT FK_carriages_train FOREIGN KEY (ID_flight) REFERENCES Flights (ID_flight) ON DELETE CASCADE;
------------------------------------------------
ALTER TABLE FlightStation ADD CONSTRAINT FK_flight_station_station FOREIGN KEY (ID_station) REFERENCES Stations (ID_station) ON DELETE CASCADE;
ALTER TABLE FlightStation ADD CONSTRAINT FK_flight_station_flight FOREIGN KEY (ID_flight) REFERENCES Flights (ID_flight) ON DELETE CASCADE;

-- ALTER TABLE Stops ADD CONSTRAINT FK_stops_stations FOREIGN KEY (ID_station) REFERENCES Stations (ID_station);
-- ALTER TABLE Stops ADD CONSTRAINT FK_stops_route FOREIGN KEY (ID_route) REFERENCES Routes (ID_route);
-- /*___________________________________________________*/
-- ALTER TABLE Carriages ADD CONSTRAINT FK_carr_train FOREIGN KEY (ID_train) REFERENCES Trains (ID_train);
-- /*___________________________________________________*/
-- ALTER TABLE Flights ADD CONSTRAINT FK_flights_trains FOREIGN KEY (ID_train) REFERENCES Trains (ID_train);
-- ALTER TABLE Flights ADD CONSTRAINT FK_flights_routes FOREIGN KEY (ID_route) REFERENCES Routes (ID_route);
-- /*___________________________________________________*/
-- ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_places FOREIGN KEY (ID_place) REFERENCES Places (ID_place);
-- ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_flights FOREIGN KEY (ID_flight) REFERENCES Flights (ID_flight);
-- ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_routes FOREIGN KEY (ID_route) REFERENCES Routes (ID_route);
-- ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_station_arrival FOREIGN KEY (ID_station) REFERENCES Stations (ID_station);
-- ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_station_departure FOREIGN KEY (Stat_ID_station) REFERENCES Stations (ID_station);
-- /*____________________________________________________*/
-- AlTER TABLE Places ADD CONSTRAINT FK_places_id_carriage FOREIGN KEY(ID_carriage) REFERENCES Carriages(ID_carriage)

