import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { ProfesorService } from 'src/app/services/profesor.service';
import { Profesor } from 'src/app/models/profesor.model';
declare var $ : any

@Component({
	selector: 'app-generales',
	templateUrl: './generales.component.html',
	styleUrls: ['./generales.component.css']
})
export class GeneralesComponent implements OnInit {

	profesor: Profesor;
	idProfesor: number;

	constructor(private router: ActivatedRoute, private profesorService: ProfesorService){
		this.profesor = new Profesor();
		this.idProfesor = 0;
	}

	ngOnInit(): void {

		$(document).ready(function(){
			$('.fixed-action-btn').floatingActionButton({
				direction: 'left',
				hoverEnabled: false
			});
			$('select').formSelect();
		  });


		this.router.paramMap.subscribe(params => {
			this.idProfesor = Number(params.get('idProfesor'));
			this.profesorService.listOne(this.idProfesor).subscribe((resProfesor: any) => {
				this.profesor = resProfesor as Profesor;
				console.log(this.profesor);
			}, 
			err => console.error(err));
			// this.profesorService.listOne(this.idProfesor).subscribe({
			// 	next: (resProfesor: any) => {
			// 		this.profesor = resProfesor as Profesor;
			// 		console.log(this.profesor);
			// 	},
			// 	error: (err) => console.error(err)
			// });
		});
	}
	modalRegistro(){
		console.log('registro')
		$('#modalRegistro').modal({ dismissible: false });
		$('#modalRegistro').modal('open');
	}

}
