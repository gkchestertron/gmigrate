# gmigrate
gmigrate is a utility for generating databse migrations with procedures in mind. It is often difficult to keep track of and test procedures, but they offer a lot of speed and power in development. gmigrate allows you to treat your procedures like code and automatically generate migration files from your changes - which is easy because procedures are generally just replaced when updated.

## Installation
To install gmigrate, first clone this repository. Then cd to your repository and run:
```
$ ./install
```

## Dependencies
gmigrate has two dependencies: bash and git. If you don't have these, I'm note real sure what you're doing here.

## Usage

### init
To setup a project to use gmigrate, run the following in the base directory of your project:
```
$ gmigrate init
```
This will generate a .gmigrate config file with default values. Like this:
```
migrations=migrations
schemas=gschemas
```
These are just variables containing paths to the folders where you keep your migration files and gmigrate files (which are separated by schema). The gschemas folder will be generated if it does not exist. You can move this if you like, just make sure to also update the .gmigrate config file.

### Adding a schema and procedures
Once you're initialized, you will need to create folders matching the name of your database schema (so yeah, this definitely has postgres in mind - it would be trivial to add support for MySQL. If you want that, then contribute). Then, in each schema folder, there needs to be an `up.sql`, a `down.sql`, and a `procedures` folder, which contains one file for each procedure (by procedure name). However gmigrate includes a command for adding these:
```
$ gmigrate add <schema name>
```
This will add the `schema` folder, and add `up.sql`, `down.sql`, and a `procedures` folder inside if the schema does not already exist.
```
$ gmigrate add <schema name> <procedure name>
```
This will add a procedure to a schema folder (unless it does not exist) with default syntax for writing a procedure (in PL/pgSQL).

### Writing ups, downs, and procedures
As a nicety, gmigrate allows you to use tokens for schema name and procedure name. For `schema` the token is `%schema%` and for procedure, it is %proc% - these may change if I find they weren't unique enough choices.

### Generating migrations
To generate a migration from your changes, just run:
```
$ gmigrate run
```
This will generate migration files (up and down) using the contents of any changed files in your schemas folder and place them in your migrations folder. Filenames will be automatically generated using a timestamp and the location of the changed files.

## Testing
To run the tests, just run:
```
./test
```
Fancy, I know.

## Contributing
Want to contribute? Just fork and pull.
