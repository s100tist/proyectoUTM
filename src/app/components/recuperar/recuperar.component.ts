import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { CorreoService } from 'src/app/services/correo.service';

@Component({
  selector: 'app-recuperar',
  templateUrl: './recuperar.component.html',
  styleUrls: ['./recuperar.component.css']
})
export class RecuperarComponent implements OnInit {
  token: any;
    

  constructor(private route : ActivatedRoute, private correoService : CorreoService) {
    this.token = ''
  }

  ngOnInit(): void {
      this.route.paramMap.subscribe(params =>
        {
            this.token = params.get("tokens");
            let dato={
              'token':this.token
            }
            console.log(this.token);
            console.log('correo: '+this.correoService.decodificarMail(this.token).subscribe())
        });
  }
  verificarContrasena(): void {
}
}
