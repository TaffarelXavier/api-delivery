"use strict";

/*
|--------------------------------------------------------------------------
| CategorySeeder
|--------------------------------------------------------------------------
|
| Make use of the Factory instance to seed database with dummy data or
| make use of Lucid models directly.
|
*/

/** @type {import('@adonisjs/lucid/src/Factory')} */
const Factory = use("Factory");

class CategorySeeder {
  async run() {
    //Popula a tabela Categoria
    const plan = await Factory.model("App/Models/Categories").createMany(1);
    //Popula a tabela Company
    const Companies = await Factory.model("App/Models/Companies").createMany(
      10
    );
    const Products = await Factory.model("App/Models/Products").createMany(
      10
    );
  }
}

module.exports = CategorySeeder;
