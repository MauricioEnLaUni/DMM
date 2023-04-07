import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import axios from './app/api/axios';

import { AppModule } from './app/app.module';

class Bus {
  Id: string;
  Name: string;

  constructor(id: string, name: string)
  {
    this.Id = id;
    this.Name = name;
  }
}

const BUSSES: Array<Bus> = [
  { Id: "1234", Name: "abcd" },
  { Id: "1234", Name: "abcd" },
  { Id: "1234", Name: "abcd" },
  { Id: "1234", Name: "abcd" },
  { Id: "1234", Name: "abcd" }
]

class Login_Dto {

}

const login = async () => {
  const LOGIN_URL = '/auth';

  try {
    const DTO: Login_Dto = new Login_Dto(request);
    const response = await axios.post(LOGIN_URL,
      JSON.stringify(DTO),
      {
        headers: { 'Content-Type': 'application/json' },
        withCredentials: true
      }
    );
  } catch (e) {

  }

  console.log(response);
  return response;
}

platformBrowserDynamic().bootstrapModule(AppModule)
  .catch(err => console.error(err));
