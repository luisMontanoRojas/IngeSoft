Feature:
Como Jugador
Quiero Seleccionar la dificultad
Para hacer el juego mas interesante
Scenario:
Given cuando estoy en la pagina de inicio
And selecciono la "dificultad" como "Medio"
And ingreso el codigo "123456" en el campo "dificultad"
When presiono el boton "jugar!" 
Then deberia ver una la pagina game