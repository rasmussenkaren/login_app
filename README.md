### Login App

El proyecto consta de las siguientes vistas:

- **/login:** Permite iniciar sesión.
- **/register:** Permite registrar un nuevo usuario.
- **/users:** Muestra una lista de todos los usuarios registrados. El acceso a esta vista requiere estar autenticado.

Cuando se registra un usuario, se envía un correo electrónico a la dirección proporcionada durante el registro. Para visualizar el correo, es necesario tener Mailcatcher en ejecución. El contenido del correo contiene un enlace para verificar la cuenta del usuario.
Luego de verificar la cuenta, el usuario puede iniciar sesión.

Dentro de `/users`, cualquier usuario autenticado tiene la capacidad de eliminar a otros usuarios.
También puede cerrar sesión en la aplicación.

#### Requisitos

- Ruby
- Rails
- Mailcatcher
- Postgresql

#### Configuración del Proyecto

1. **Clona este repositorio:**

   `git clone git@github.com:rasmussenkaren/login_app.git`

2. **Instala las gemas:**

   `bundle install`

3. **Configura la base de datos:**

   `rails db:create`

   `rails db:migrate`

   Puedes personalizar la configuración en el archivo `config/database.yml`.

4. **Levanta el servidor:**

   `rails server`

5. **Levanta mailcatcher:**

   `mailcatcher`
