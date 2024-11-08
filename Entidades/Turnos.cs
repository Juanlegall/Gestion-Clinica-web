using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    internal class Turnos
    {
        private int id_usuario;
        private DateTime fecha_consulta;
        private string hora_consulta;
        private int id_paciente;
        private string observaciones;
        private int realizado;


        public Turnos()
        {

        }

        public void setIdUsuario(int id)
        {
            this.id_usuario = id;
        }

        public void setFechaConsulta(DateTime fecha)
        {
            this.fecha_consulta = fecha;
        }

        public void setHoraConsulta(string hora)
        {
            this.hora_consulta = hora;
        }
        public void setIdPaciente(int id)
        {
            this.id_paciente = id;
        }

        public void setObservaciones(string observaciones)
        {
            this.observaciones = observaciones;
        }

        public void setRealizado(int realizado)
        {
            this.realizado = realizado;
        }

        public int getIdUsuario()
        {
            return id_usuario;
        }

        public DateTime getFechaConsulta()
        {
            return fecha_consulta;
        }
        public string getHoraConsulta()
        {
            return hora_consulta;
        }
        public int getIdPaciente()
        {
            return id_paciente;
        }

        public string getObservaciones()
        {
            return observaciones;
        }
        public int getRealizado()
        {
            return realizado;
        }
    }
}
