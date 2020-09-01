# Framework et Base de données d'Entreprise(plpgsql)

Ceci est un projet S6 dans le parcours de l'IT University regroupant un framework MVC, ORM et quelques procédure de la base de donnée Postgresql.

## Prérequis

Indiquer le servlet framework et le package où se trouve les controleurs dans web.xml

```xml
<?xml version="1.0" encoding="UTF-8"?>
<web-app version="3.1" xmlns="http://xmlns.jcp.org/xml/ns/javaee" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_3_1.xsd">
    <filter>
        <filter-name>Interceptor</filter-name>
        <filter-class>filter.Interceptor</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>Interceptor</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
    <servlet>
        <servlet-name>MiniSpring</servlet-name>
        <servlet-class>servlet.MiniSpring</servlet-class>
        <init-param>
            <param-name>controllers-package</param-name>
            <param-value>controller</param-value>
        </init-param>
    </servlet>
    <servlet-mapping>
        <servlet-name>MiniSpring</servlet-name>
        <url-pattern>/miniSpring</url-pattern>
    </servlet-mapping>
    <session-config>
        <session-timeout>
            30
        </session-timeout>
    </session-config>
</web-app>
```

Pour tester le framework, ajouter l'extension _.action_ à la fin de chaque url.
Voici des exemples de l'utilisation du framework MVC pour chaque couche.

## Controleur

```java
package controller;

import annotation.Controller;
import annotation.Folder;
import annotation.Path;
import core.Model;
import model.Person;
import core.Json;

@Controller(path="/JspController")
public class JspController {
    @Path(name="/home")
    public String displayHomePage(Person person, Model model) {
        model.addAttribute("personne", person);
        model.addToSession("Foo", "bar");
        return "home";
    }

    @Path(name="")
    public String index() {
        return "index";
    }

    @Path(name="/json")
    public Json getJson(Person person) {
        Json json = new Json();
        json.setData(person);
        json.setStatusCode(200);
        return json;
    }

    @Path(name="/backoffice")
    @Folder(path="backoffice")
    public String displayBackoffice() {
        return "page";
    }
}
```

Chaque controleur doit etre annoté (Supprimer les '{}') pour l'identifier parmi les autres controleurs:

```java
@Controller(path="/{urlControleur}")
```

Chaque méthode représentée par une url dans le controleur doit être annoté pour la même raison:

```java
@Path(name="/{urlMethode}")
```

Dans l'exemple de la classe complète, pour accéder par exemple à la méthode displayHomePage il faut aller à l'url, ex:
http://localhost/monapp/JspController/home

### Type de retour des methodes

- `String` pour une vue jsp
- `Json` pour du json

#### Type String

La valeur à retourner est le nom du fichier jsp de la vue. Par défaut les page jsp sont à placer directement dans le dossier WEB-INF à la racine. Si on souhaite indiquer une page dans un sous dossier de WEB-INF alors il faut annoter la méthode par:

```java
@Folder(path="{nomDossier}")
```

#### Type Json

Pour retourner un Json il faut que la méthode retourne un `Json` du package `core.Json` et créer puis retourner une instance de cette classe dans la définition de la méthode.

- Pour modifier le contenu du json, il faut faire appel à `setData(Object objet)`
- Pour avoir un http status code perso `setStatusCode(int code)`

### Passage d'objets à la vue

Pour passer des objets à la vue il faut utiliser la classe `Model` du package `core.Model` et utiliser les méthodes:

- `addAttribute(String cle, Object valeur)` pour placer l'objet dans la portée `request`
- `addToSession(String cle, Object valeur)` pour placer l'objet dans la portée `session`

### Mapping formulaire vers POJO

Il est possible de récupérer tous les entrée d'un formulaire vers n'importe quelle classe. Il suffit d'indiquer la classe dans la méthode du controlleur en **premier argument**. Une instance de cette classe sera créé et pour chaque paramètre de reçu de la requête, si le nom du paramètre correspond à un attribut de la classe alors l'attribut de l'instance aura la valeur du paramètre.
