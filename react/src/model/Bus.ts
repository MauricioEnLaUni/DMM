class Bus {
  id: number;
  name: string;
  home_city: string;
  home_state: string;
  departure: Date;
  destination_city: string;
  destination_state: string;
  arrival: Date;
  seats: number;

  constructor(id: number, name: string, home_city: string, home_state: string, departure: Date, destination_city: string, destination_state: string, arrival: Date, seats: number)
  {
    this.id = id;
    this.name = name;
    this.home_city = home_city;
    this.home_state = home_state;
    this.departure = departure;
    this.destination_city = destination_city;
    this.destination_state = destination_state;
    this.arrival = arrival;
    this.seats = seats;
  }
}