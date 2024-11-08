using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    internal class HorariosMedicos
    {
        private int id_paciente;
        private int id_medico;
        private DateTime fecha_consulta;
        private string hora;
        private string motivo_consulta;
        private string observaciones;
        private int realizado;
        private DateTime fecha_baja;

        public HorariosMedicos()
        {

        }

        public void setIdPaciente(int id)
        {
            this.id_paciente = id;
        }

        public void setIdMedico(int id)
        {
            this.id_medico = id;
        }

        public void setFecha(DateTime fecha)
        {
            this.fecha_consulta = fecha;
        }

        public void setHora(string hora)
        {
            this.hora = hora;
        }
        public void setMotivoConsulta(string  motivo)
        {
            this.motivo_consulta = motivo;
        }

        public void setObservaciones(string observacion)
        {
            this.observaciones = observacion;
        }


        public void setRealizado(int realizado)
        {
            this.realizado = realizado;
        }

        public void setFechaBaja(DateTime fecha)
        {
            this.fecha_baja = fecha;
        }


        public int getIdPaciente()
        {
            return id_paciente;
        }

        public int getIdMedico()
        {
            return id_medico;
        }
        public DateTime getFechaConsulta()
        {
            return fecha_consulta;
        }

        public DateTime getFechaBaja()
        {
            return fecha_baja;
        }

        public string getHora()
        {
            return hora;
        }


        public string getMotivoConsulta()
        {
            return motivo_consulta;
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
