import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root',
})
export class CorreoService {
  constructor(private http: HttpClient) {}
  enviarCorreoRecuperarContrasena(body: any) {
    return this.http.post(
      `${environment.API_URL_CORREOS}/enviarCorreoRecuperarContrasenya/`,body
    );
  }
  decodificarMail(token: any) {
    return this.http.post(
      `${environment.API_URL_CORREOS}/decodificarMail/`,token
    );
  }
}
