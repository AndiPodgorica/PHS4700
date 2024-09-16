# PHS4700 - Physique pour multimédia

Le cours pas nice que tu dois prendre même si t'es pas en multimedia
**(╯°□°）╯︵ ┻━┻**

## Devoir 1

### main.m
Fichier à partir duquel on devrait commencer la simulation.

### CentreDeMasse.m
Fonction pour avoir le centre de masse combiné de tous les objets.

### Objet.m
Objet de base pour les propriétés d'un objet.

- Masse
- MasseVolumique
- CentreDeMasse
- Volume

### Cylindre.m
Hérite d'Objet et défini deux propriétés supplémentaire et le calcul du volume

- Longueur
- Rayon

## Devoir 2

## Trucs Matlab

### Classes
Une classe c'est pas nécessairement ce dont à quoi on s'attendrait.

Première particularité, un objet pour pouvoir être passé par *référence* à sa propre méthode
doit hériter de **handle**. Ceci permet de modifier une propriété sur l'objet lui-même et 
non sur sa copie. 

Ensuite, hériter d'une classe veut pas dire qu'on peut appeler ses méthodes. Pour ce faire,
il faut les *override* et caller le parent

```
function m = CalcMasse(obj)
    m = CalcMasse@Objet(obj);
end
```

### Manipulation de matrices
Pour faire une multiplication de matrice inverse (division) `A^-1 * B` peut faire deux choses : 

```
Pour a^-1 * b remplacer inv(A)*b with A\b
Pour b * a^-1 remplacer b*inv(A) with b/A
```

**Références** :

* [Classes de base] (http://www.mathworks.com/help/matlab/matlab_oop/getting-familiar-with-classes.html#buoz2sc)
* [Héritage] (http://www.mathworks.com/help/matlab/matlab_oop/creating-subclasses--syntax-and-techniques.html)
* [Appel de *superclass*] (http://www.mathworks.com/help/matlab/matlab_oop/calling-superclass-methods-on-subclass-objects.html#bsa1tzj)
