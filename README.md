# Gestión Clínica Web
 

 ![GitHub stars](https://img.shields.io/github/stars/FranSanchezM/gestion-clinica-web?style=social)
 ![GitHub forks](https://img.shields.io/github/forks/FranSanchezM/gestion-clinica-web?style=social)
 
 Este repositorio contiene el código fuente de un **Sistema ABML (Altas, Bajas, Modificaciones y Listados)** para la gestión de una clínica. La aplicación está desarrollada utilizando **ASP.NET** y el lenguaje de programación **C#**.
 
 ## Tabla de Contenidos
 
 * [Características Principales](#características-principales)
 * [Tecnologías Utilizadas](#tecnologías-utilizadas)
 * [Configuración](#configuración)
     * [Clonado del Repositorio](#clonado-del-repositorio)
     * [Configuración de la Base de Datos](#configuración-de-la-base-de-datos)
     * [Configuración de la Aplicación](#configuración-de-la-aplicación)
 * [Ejecución de la Aplicación](#ejecución-de-la-aplicación)

 
 ## Características Principales
 
 Describe aquí las funcionalidades clave de tu sistema ABML para la clínica. Algunos ejemplos podrían ser:
 
 * **Gestión de Pacientes:**
     * Alta de nuevos pacientes (nombre, apellido, DNI, fecha de nacimiento, etc.).
     * Baja de pacientes del sistema.
     * Modificación de la información de pacientes existentes.
     * Listado y búsqueda de pacientes por diferentes criterios.
 * **Gestión de Médicos:**
     * Alta de nuevos médicos (nombre, apellido, especialidad, etc.).
     * Baja de médicos del sistema.
     * Modificación de la información de médicos existentes.
     * Listado y búsqueda de médicos por especialidad u otros criterios.
 * **Gestión de Turnos/Citas:**
     * Registro de nuevos turnos/citas.
     * Cancelación de turnos/citas.
     * Modificación de la información de turnos/citas.
     * Listado de turnos/citas por fecha, médico, paciente, etc.
 * **Gestión de Historias Clínicas:**
     * Creación y visualización de historias clínicas de pacientes.
     * Registro de consultas, diagnósticos y tratamientos.
 * **Gestión de Usuarios del Sistema:**
     * Creación y gestión de cuentas de usuario con diferentes roles.
     * Control de acceso a diferentes funcionalidades del sistema.
 * **Otras funcionalidades relevantes de tu sistema.**
 
 ## Tecnologías Utilizadas
 
 Enumera las principales tecnologías que utilizaste en el desarrollo de la aplicación:
 
 * **Lenguaje de Programación:** C#
 * **Framework Backend:** ASP.NET 
 * **Base de Datos:** SQL
 
 * **Frontend **
     * HTML
     * CSS
     * Boostrap
 
 
 ### Clonado del Repositorio
 
 Para obtener una copia del proyecto en tu máquina local, utiliza el siguiente comando:
 

 git clone [https://github.com/Juanlegall/Gestion-Clinica-web.git](https://github.com/Juanlegall/Gestion-Clinica-web.git)


### Configuración de la Base de Datos

1. **Crear la Base de Datos:**
   - Abrí SQL Server Management Studio (SSMS) u otro gestor compatible.
   - Ejecutá el script `ScriptGestionClinica.sql`.

2. **Verificá las tablas creadas:**
   - Asegurate de que se hayan creado correctamente las tablas como `Pacientes`, `Medicos`, `Turnos`, `Usuarios`, etc.


### Configuración de la Aplicación

1. **Abrir el proyecto en Visual Studio:**
   - Abrí el archivo de solución `.sln` con Visual Studio 2022 o superior.

2. **Configurar la cadena de conexión:**
   - Abrí el archivo `Web.config`.
   - Buscá la sección `<connectionStrings>` y modificá la cadena con los valores de tu servidor, base de datos, usuario y contraseña.

   ```xml
   <connectionStrings>
     <add name="ClinicaConnection" 
          connectionString="Data Source=TU_SERVIDOR;Initial Catalog=NombreBaseDeDatos;User ID=usuario;Password=contraseña;" 
          providerName="System.Data.SqlClient" />
   </connectionStrings>

