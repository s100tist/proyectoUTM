import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Usuario } from 'src/app/models/usuario.model';
import { UsuarioService } from 'src/app/services/usuario.service';
import { Profesor } from 'src/app/models/profesor.model';
import Swal from 'sweetalert2';
import { CorreoService } from 'src/app/services/correo.service';
declare var $: any;

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css'],
})
export class LoginComponent implements OnInit {
  usuario: Usuario;
  idProfesor: number;
  

  constructor(private usuarioService: UsuarioService, private router: Router, private correoService: CorreoService) {
    this.usuario = new Usuario();
    this.idProfesor = 0;
  }

  ngOnInit(): void {}

  logueo(): void {
    if (!(this.usuario.correo === '') && !(this.usuario.password === '')) {
      this.usuarioService
        .existe(this.usuario.correo, this.usuario.password)
        .subscribe((resUsuario) => {
          if (resUsuario != -1) {
            console.log(resUsuario);
            this.idProfesor = Number('Token:\n' + resUsuario);
            localStorage.setItem('token', resUsuario + '');
            localStorage.setItem('correo',this.usuario.correo);
            localStorage.setItem('idProfesor', this.idProfesor + '');
            this.router.navigateByUrl(`/home/generales/${this.idProfesor}`);
          } else {
            Swal.fire({
              position: 'center',
              icon: 'error',
              title: `Datos incorrectos`,
            });
          }
        });
    }
  }

  modalCambiarPassword(): void {
    console.log('modalCambiarPass');
    $('#modalCambiarPassword').modal({ dismissible: false });
    $('#modalCambiarPassword').modal('open');
  }

  cambiarContrasena(): void {
    this.correoService.enviarCorreoRecuperarContrasena(this.usuario).subscribe((resUsuario: any) =>{
        console.log(resUsuario);
    },
    err => console.error(err));
  }
}
