from werkzeug.security import check_password_hash
from flask_login import UserMixin

class User(UserMixin):
    def _init_(self, id, nombre, correo, clave, fechareg, perfil) -> None:
        self.id = id
        self.nombre = nombre
        self.correo = correo
        self.clave = clave
        self.fechareg = fechareg
        self.perfil = perfil;
    @classmethod
    def validarClave(self,clabeCifrada,clave):
        return check_password_hash(clabeCifrada, clave)