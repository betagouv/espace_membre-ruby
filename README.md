# espace_membre-ruby

Cette gem fournit des classes ActiveRecord communes pour encapsuler et
partager la logique de l'Espace-Membre. Elle est [déjà
utilisée](https://github.com/betagouv/espace_membre-ruby/network/dependents)
par d'autres produits pour construire autour des données beta.gouv.fr
et leurs logique métier (ex: "est-ce qu'un produit est actif ?", "qui
est considéré alumni", etc).

## Installation

Dans votre Gemfile:

```ruby
gem "espace_membre-ruby"
```

Puis vous devez indiquer à Rails la base de données de Beta au travers
d'une nouvelle base `espace_membre_db`, c.f [la configuration de
standards.beta.gouv.fr](https://github.com/betagouv/standards-front/blob/main/config/database.yml#L1-L6).

Ensuite vous pouvez lancer votre console et vérifier que le connecteur
fonctionne bien :

```ruby
EspaceMembre::User.without(:active_missions).last(10)
```

## Documentation

Pas encore disponible mais vous pouvez [consulter la liste des
modèles](https://github.com/betagouv/espace_membre-ruby/tree/main/lib/espace_membre)
ou [les tests
associés](https://github.com/betagouv/espace_membre-ruby/blob/53e282c9e3afff9bd4fbaf7bd0cf15734756e9cc/spec/dummy/spec/models/user_spec.rb#L30)
pour explorer la gem.

## TODO

- [ ] allow configuration (database name)
- [X] restore RSpec
- [X] run the tests
- [X] distribute.
