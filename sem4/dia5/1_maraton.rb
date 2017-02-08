# Pendiente
=begin
Maratón

Algún día has jugado Maratón? Este es un juego en el que existe una baraja de cartas. Cada carta contiene una pregunta con una serie de opciones donde solo una de ellas es la respuesta a la pregunta.
En este ejercicio vamos a crear en equipos una aplicación para jugar maratón, nuestra primera implementación no contendrá opciones si no que le daremos al usuario un solo intento para adivinar la respuesta.

Tu juego se verá de la siguiente manera:

$ ruby maraton.rb
Bienvenido a Maratón. Te daremos una pregunta y deberás adivinar la respuesta correcta.
Listo?  Arranca el juego!

Pregunta
¿Quién inventó el revolver en el siglo XIX?

Intento: Mark Zetme
Incorrecto!

Pregunta
¿Quién inventó el revolver en el siglo XIX?

Intento: Mark Zetme
Incorrecto!

# Así sigue el juego hasta acabar con las cartas

Acabaste:
Tuviste 5 Correctas y 3 Incorrectas.
Este va a ser tu primera aplicación utilizando Github!, sigue los pasos correctos del flujo de trabajo para no tener problemas. Recuerda hacer "commit" lo más seguido posible.

Objetivos Académicos
Comprender como separar responsabilidades
Crear una aplicación de interactiva por medio de la consola
Poder desarrollar en diferentes archivos
Actividades
Diseña y planea tu aplicación
Lo primero que deberás hacer es planear tu aplicación. Utiliza pseudocódigo y wireframes.

Como va a funcionar el flujo?
Que clases voy a necesitar? y que métodos voy a necesitar?
Que debe de ir en cada parte de tu MVC.
Realmente comprendes la lógica del juego? Escribe paso por paso que debe de pasar.
Dentro de tus clases que métodos deben ser públicos y cuales privados.
Vamos a hacer esta aplicación siguiendo el patrón MVC, entre más hagamos aplicaciones de este tipo más comprendas los beneficios que tienen.

Model-View-Controller.
Pregúntate lo siguiente:

Que representa el Modelo?
Que responsabilidad tiene el controlador?
Para que sirve la vista?
Se parecen mucho la vista y el controlador, esta bien duplicar tanto?
Crea tus cartas
Deberás crear una serié de preguntas y respuestas, en Internet podrás encontrar muchos ejemplos. No te compliques y no escribas más de 15 preguntas. Agrega estas preguntas a un archivo CSV con el siguiente formato: En una linea la pregunta, en la siguiente la respuesta y una linea vacía para separar entre esta pregunta y la que sigue.

Esta es la pregunta uno
Respuesta uno

Esta es la pregunta dos
Respuesta dos
Nuestro programa
Recuerda y probando tu programa constantemente para saber que esta sirviendo. Piensa en las siguientes cosas? y donde deben de ir según el MVC?

Como va a empezar tu juego y en que parte del MVC comienza?
Como vas a sacar del archivo las preguntas y respuestas
Como vas a revisar si una pregunta es correcta o incorrecta
Como va a terminar el juego?
Agrega más funcionalidad
Si lograste acabar esta aplicación ahora puedes mejorar su funcionalidad.

Deberás implementar que el usuario pueda escoger un "Deck" diferente de cartas. Por ejemplo las que son de "Historia", "Geografía", "Entretenimiento", etc.

Finalmente también puedes agregar funcionalidad para que cada pregunta tenga tres opciones y que el usuario tenga que escoger entre ellas la correcta.
=end
