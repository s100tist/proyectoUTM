import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Profesor } from 'src/app/models/profesor.model';

@Injectable({
	providedIn: 'root'
})
export class ProfesorService {

	constructor(private http: HttpClient) {

	}

	existe(profesor: Profesor, correo: string) {
		return this.http.post(`${environment.API_URL}/profesores/existe/${correo}`,profesor);
	}

	guardarProfesor(profesor: Profesor) {
		return this.http.post(`${environment.API_URL}/profesores/create`, profesor);
	}

	list(){
		return this.http.get(`${environment.API_URL}/profesores/`);
	}

	listOne(idProfesor: number) {
		return this.http.get(`${environment.API_URL}/profesores/${idProfesor}`);
	}
	
	actualizarProfesor(idProfesor: number, profesor: Profesor) {
		return this.http.put(`${environment.API_URL}/profesores/update/${idProfesor}`, profesor);
	}
	
	eliminarProfesor(idProfesor: number) {
		return this.http.delete(`${environment.API_URL}/profesor/delete/${idProfesor}`);
	}

	listAutoresByArticulo(idArticulo: number) {
		return this.http.get(`${environment.API_URL}/profesores/profesores-by-articulo/${idArticulo}`);
	}

	cambiarContrasena(profesor: Profesor, idProfesor: number) {
		console.log("estoy en el servicio")
		console.log(profesor)
		console.log(idProfesor)
		return this.http.post(`${environment.API_URL}/profesores/cambiarContrasena/${idProfesor}`,profesor);
	}

}