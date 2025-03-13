

Introducción

Aprender sobre las tareas tipicas de la metodologia de ciencia de datos de los seis pasos y asi podder crear un escenario de proyecto aprendiendo de estos ejemplos a medida que nosotros avancemos en cada momento

Objetivos de
aprendizaje

Después de completar este módulo, debería ser capaz de:

Explore el escenario de un proyecto de datos e identifique las tareas clave a medida que avanza a través de una metodología

====================================================================

Descripción general de la metodología

Esta metodología de ciencia de datos sigue seis pasos clave para estructurar proyectos de análisis de datos de manera repetible e independiente de herramientas tecnológicas:

Comprensión del negocio: Identificar el problema empresarial.
Exploración y preparación de datos: Recopilar y limpiar los datos.
Representación y transformación de datos: Convertir los datos en un formato adecuado.
Visualización y presentación de datos: Comunicar los hallazgos de manera efectiva.
Entrenamiento de modelos de datos: Crear modelos para predecir problemas futuros.
Implementación de modelos de datos: Desplegar la solución en el entorno empresarial.


===============================================================


Comprensión del negocio:

El primer paso en un proyecto de ciencia de datos es la comprensión del negocio, donde el equipo debe identificar claramente el problema a resolver.

Elementos clave de este paso:
El patrocinador comercial inicia y apoya el proyecto, asegurando que se enfoque en una necesidad real.
Se puede usar pensamiento de diseño, una metodología centrada en el usuario, para:
Definir el problema y los objetivos del proyecto.
Crear perfiles de usuarios finales.
Documentar los requisitos desde una perspectiva empresarial.
Una vez definido el problema, un científico de datos traduce el desafío en un enfoque analítico, aplicando técnicas estadísticas y de aprendizaje automático, como la regresión logística para predicciones binarias.
Este proceso garantiza que el análisis de datos esté alineado con los objetivos del negocio.

==============================================================


paso2:

exploración y preparación de datos

En este paso, reviso y recopilo datos de diferentes fuentes (hojas de cálculo, bases de datos, internet). Primero, los exploro para identificar patrones y posibles problemas. Luego, los preparo limpiando errores, eliminando valores faltantes y combinando información relevante.

Este proceso es clave porque si los datos no están bien organizados, cualquier análisis posterior puede ser incorrecto. Un ejemplo sería analizar datos de empleados (edad, salario, estado civil) para detectar patrones de retención y rotación.
=========================================================================


Representación y transformación de datos

Aquí me aseguro de que los datos estén en el formato correcto para el análisis. Uso estadísticas descriptivas (promedio, mediana, desviación estándar) para entender mejor la información y detectar patrones. También aplico visualizaciones como gráficos y tablas para hacer más evidente la relación entre los datos.

Si los datos no están estructurados (como texto o imágenes), los transformo en un formato que los modelos de aprendizaje automático puedan interpretar, por ejemplo, convirtiendo texto en números con técnicas como la tokenización.

En el caso del proyecto, Scott agrega una columna de "Desgaste" en los datos de empleados para identificar quién ha dejado la empresa. Esto ayudará a entrenar un modelo de aprendizaje supervisado y encontrar patrones que expliquen la rotación del personal.

=============================================================

La visualización de datos es clave para entender y comunicar los resultados de un análisis. Sirve para probar hipótesis, verificar suposiciones y contar una historia clara que responda a un problema empresarial.

Existen diferentes tipos de visualizaciones según el propósito:

Gráficos circulares: Muestran proporciones de categorías.
Gráficos de barras/columnas: Comparan valores entre categorías o a lo largo del tiempo.
Gráficos de líneas: Representan tendencias y cambios continuos.
Gráficos de dispersión: Identifican relaciones entre variables.
En el caso del proyecto, Scott usa un gráfico de dispersión con curva S para identificar que los empleados que viven más lejos tienen más probabilidades de renunciar. Esto no era evidente solo con los datos, pero la visualización lo dejó claro.

Scott presenta los hallazgos al equipo y a RR.HH., proponiendo permitir el trabajo remoto algunos días a la semana para reducir la rotación. La empresa decide seguir monitoreando los datos y considerar construir un modelo predictivo en el futuro.


====================================================================

Implementación de modelos de datos


Scott Hill despliega un modelo en GAXR con IBM AutoAI para predecir el riesgo de que los empleados renuncien por largos tiempos de viaje.

Preguntas clave para el mantenimiento:

¿Cómo evaluar el rendimiento? → Usar métricas como precisión y error cuadrático medio.
¿Cuándo reentrenar el modelo? → Según cambios en los datos, puede ser mensual o trimestral.
¿El formato de los datos es diferente en producción? → Ajustar si hay cambios.
¿Los datos llegan en lotes o en tiempo real? → Adaptar el procesamiento.
¿Se necesita ejecutar sin conexión? → Preparar una versión offline si es necesario.