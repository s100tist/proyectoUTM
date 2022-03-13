import { Component, OnInit } from '@angular/core';
import { ActivatedRoute , Route, Router} from '@angular/router';
import { CorreoService } from 'src/app/services/correo.service';
import { ProfesorService } from 'src/app/services/profesor.service';


@Component({
  selector: 'app-recuperar',
  templateUrl: './recuperar.component.html',
  styleUrls: ['./recuperar.component.css']
})
export class RecuperarComponent implements OnInit {
  token: any
  contra :string
  contra2 : string
  id : number = 0
  password!: any;
    

  constructor(private route : ActivatedRoute, private correoService : CorreoService, private profeService : ProfesorService, private router : Router) {
    this.token = ''
    this.contra = ''
    this.contra2 = ''
  }

  ngOnInit(): void {
      this.route.paramMap.subscribe(params =>
        {
            this.token = params.get("tokens");
            let dato={
              'token':this.token
            }
            console.log(this.token);
            this.correoService.decodificarMail(dato).subscribe((auxiliar : any)=>{
              this.id = auxiliar.idProfesor
              console.log(this.id)
              if (!this.id){
                this.router.navigateByUrl('/login');
              }
            },err => console.error(err)
            )
        });   
  }

  verificarContrasena(): void {
    if((this.contra) == '' || (this.contra2 != this.contra)){
        console.log('contraseñas inválidas')
    }else{
      this.password = {'password' : this.contra }
      this.profeService.cambiarContrasena(this.password, this.id ).subscribe(err => console.error(err));
      this.router.navigateByUrl('/login');


}
}


} 
