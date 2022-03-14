import { Router } from 'express';
import { profesoresController } from '../controllers/profesoresController';

class ProfesoresRoutes {
	public router: Router = Router();
	constructor() {
		this.config();
	}

	config(): void {
		this.router.get('/', profesoresController.list);
		this.router.get('/:idProfesor', profesoresController.listOne);
		this.router.post('/create', profesoresController.create);
		this.router.post('/cambiarContrasena/:idProfesor',profesoresController.cambiarContrasena);
		this.router.post('/existe/:correoProfesor', profesoresController.existe);
		this.router.delete('/delete/:idProfesor', profesoresController.delete);
		this.router.get('/profesores-by-carrera/:idCarrera', profesoresController.listProfesoresByCarrera);
		this.router.get('/profesores-by-articulo/:idArticulo', profesoresController.listProfesoresByArticulo);
	}
}

const profesoresRoutes = new ProfesoresRoutes();
export default profesoresRoutes.router;