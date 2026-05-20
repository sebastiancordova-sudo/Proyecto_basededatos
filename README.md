# Proyecto_basededatos
Sistema integral de gestión de mantenimiento ciclista y asistencia de emergencia en tiempo real.


📋 Información General
CampoDetalleAsignaturaBase de DatosCarreraComputación — FEIRNNRCiclo3 AUnidad1EstudianteSebastián CórdovaDocenteEdwin René Guamán Quinche

Descripción del Proyecto
BiciSafe & Tech es una plataforma diseñada para centralizar la gestión operativa de talleres de mantenimiento ciclista y garantizar la seguridad activa del ciclista en ruta.
El sistema resuelve dos grandes problemas:

Operativo: administración manual y fragmentada de órdenes de trabajo, inventarios, compras y facturación en talleres ciclistas.
De seguridad: ausencia de un mecanismo que monitoree el desgaste de componentes y notifique la ubicación del ciclista ante una emergencia.


Objetivos
General
Diseñar e implementar una base de datos relacional para la plataforma BiciSafe & Tech mediante el modelado conceptual, lógico y físico, con el fin de centralizar y gestionar eficientemente los procesos de mantenimiento predictivo, administración de talleres y asistencia de emergencia en tiempo real.
Específicos

Elaborar el diagrama Entidad-Relación que identifique entidades, atributos y relaciones del sistema.
Implementar el esquema relacional físico con sentencias SQL (DDL y DML) y consultas de álgebra relacional.


Estructura del Repositorio
BaseDeDatosU1/
│
├── crear_base.sql        # DDL: Creación de tablas y restricciones
├── datos.sql             # DML: Inserción de datos de ejemplo
├── consultas.sql         # 5 consultas de álgebra relacional → SQL
├── diagrama_ER.png       # Diagrama Entidad-Relación
├── diagrama_ER.xml       # Archivo editable draw.io del E-R
├── diagrama_relacional.png  # Modelo Relacional
└── README.md

Tablas de la Base de Datos
El sistema cuenta con 13 tablas relacionadas entre sí:
TablaDescripciónClienteCiclistas y administradores registradosBicicletaBicicletas asociadas a cada clienteComponentePiezas de cada bicicleta con control de desgaste por kmAlerta_SOSRegistros de alertas de emergencia con geolocalizaciónContacto_EmergenciaContactos de emergencia por clienteMecanicoMecánicos del taller con su especialidadOrden_TrabajoÓrdenes de mantenimiento asignadas a mecánicosRepuestoCatálogo de repuestos con stock y precioProveedorProveedores de repuestosOrden_CompraCompras realizadas a proveedoresUtilizaRelación entre órdenes de trabajo y repuestos usadosIncluyeRelación entre órdenes de compra y repuestos adquiridosFacturaFacturas generadas por cada orden de trabajo

Consultas Implementadas
#OperadorDescripción1Selección σÓrdenes de trabajo con estado "Pendiente"2Proyección πNombres y correos de clientes3σ + π combinadosBicicletas con más de 1000 km recorridos4Reunión natural ⋈Clientes con sus bicicletas registradas5Agrupamiento γ + SUMTotal facturado agrupado por estado de factura

FEIRNNR — Carrera de Computación · 2026
