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

CREATE TABLE Stations(
	ID_station SERIAL NOT NULL,
	Name_station name_custom NOT NULL
);

CREATE TABLE Stops(
	ID_route identify NOT NULL,
	ID_stop SERIAL NOT NULL,
	ID_station identify NOT NULL,
	transit BOOLEAN
);

CREATE TABLE Routes(
	ID_route SERIAL NOT NULL,
	Region  name_custom NOT NULL,
	City    name_custom NOT NULL
);

CREATE TABLE Flights(
	ID_flight SERIAL NOT NULL,
	ID_route identify NOT NULL,
	ID_train identify NOT NULL
);

CREATE TABLE Tickets (
	ID_ticket SERIAL NOT NULL,
	ID_place identify NOT NULL,
	ID_route identify NOT NULL,
	ID_station identify NOT NULL,
	Stat_ID_station identify NOT NULL,
	ID_flight identify NOT NULL,
	date_arrival DATE NOT NULL,
	date_dispatch DATE NOT NULL,
	passport_number INTEGER NOT NULL,
	full_name VARCHAR(80) NOT NULL
);

CREATE TABLE Places(
	ID_carriage identify NOT NULL,
	place identify NULL,
	ID_place SERIAL NOT NULL
);

CREATE TABLE Carriages(
	ID_train identify NOT NULL,
	carriage identify NULL,
	ID_carriage SERIAL NOT NULL
);

CREATE TABLE Trains(
	ID_train SERIAL NOT NULL,
	train_number identify NULL
);

ALTER TABLE Stations ADD CONSTRAINT PK_stations PRIMARY KEY (ID_station);
ALTER TABLE Stops ADD CONSTRAINT PK_stops PRIMARY KEY (ID_route, ID_stop);
ALTER TABLE Routes ADD CONSTRAINT PK_routes PRIMARY KEY (ID_route);
ALTER TABLE Flights ADD CONSTRAINT PK_flights PRIMARY KEY (ID_flight);
ALTER TABLE Tickets ADD CONSTRAINT PK_tickets PRIMARY KEY (ID_ticket);
ALTER TABLE Places ADD CONSTRAINT PK_places PRIMARY KEY (ID_place);
ALTER TABLE Carriages ADD CONSTRAINT PK_carriages PRIMARY KEY (ID_carriage);
ALTER TABLE Trains ADD CONSTRAINT PK_trains PRIMARY KEY (ID_train);


ALTER TABLE Stops ADD CONSTRAINT FK_stops_stations FOREIGN KEY (ID_station) REFERENCES Stations (ID_station);
ALTER TABLE Stops ADD CONSTRAINT FK_stops_routes FOREIGN KEY (ID_route) REFERENCES Routes (ID_route);
/*___________________________________________________*/
ALTER TABLE Carriages ADD CONSTRAINT FK_carr_train FOREIGN KEY (ID_train) REFERENCES Trains (ID_train);
/*___________________________________________________*/
ALTER TABLE Flights ADD CONSTRAINT FK_flights_trains FOREIGN KEY (ID_train) REFERENCES Trains (ID_train);
ALTER TABLE Flights ADD CONSTRAINT FK_flights_routes FOREIGN KEY (ID_route) REFERENCES Routes (ID_route);
/*___________________________________________________*/
ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_places FOREIGN KEY (ID_place) REFERENCES Places (ID_place);
ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_flights FOREIGN KEY (ID_flight) REFERENCES Flights (ID_flight);
ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_routes FOREIGN KEY (ID_route) REFERENCES Routes (ID_route);
ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_station_arrival FOREIGN KEY (ID_station) REFERENCES Stations (ID_station);
ALTER TABLE Tickets ADD CONSTRAINT FK_tickets_station_departure FOREIGN KEY (Stat_ID_station) REFERENCES Stations (ID_station);
/*____________________________________________________*/
AlTER TABLE Places ADD CONSTRAINT FK_places_id_carriage FOREIGN KEY(ID_carriage) REFERENCES Carriages(ID_carriage)

