Para ejecutar el robot que migra datos desde Excel a Orange, seguir estos pasos :

1 - Instalarse Ruby
2 - En la consola posicionarse en la carpeta de este proyecto y ejecutar : bundle install
3 - Ejecutar "rspec spec"

Este proyecto deja un log llamado "result-#{fecha}.csv" con los problemas que se encontró el robot y hay un log llamado "result_in_live" que en tiempo real indica por que fila del excel se encuentra procesando (se puede hacer un tail en consola para verlo).