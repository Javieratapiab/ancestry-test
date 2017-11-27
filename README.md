# Ancestry test :octocat:

Se busca una estructura jerárquica en la cual cada gerencia/departamento contenga un promedio de notas dado por sus departamentos hijos que deberá refrescarse al crearse un nuevo recurso.

## Herramientas :pushpin:

1. Rails 5 in api mode. 
2. Tree structure: Gema 'Ancestry' https://github.com/stefankroes/ancestry.
3. Postgresql como database adapter.

## Instalación inicial
```
    bundle install
```

##  Instalación básica de base de datos :pushpin:
```
    rake db:create
    rake db:migrate
    rake db:seed
```
## Endpoints disponibles :pushpin:

> Consideraciones:

    1. Sólo podrá ser creado un departamento/gerencia no existente. (POST)
    2. No se permiten grades inferiores a 0. (Existe validación)

- GET: 'api/v1/managements'. Devuelve un JSON con árbol jerárquico. 

- POST: 'api/v1/managements'. Crea un nuevo recurso.
> Params requeridos:
    - parent_id: integer
    - area: string
    - grade: float

- PUT: 'api/v1/managements/:management_id/update. Actualiza un nuevo recurso.
> Params requeridos:
    - id: integer
    - area: string
    - grade: string

