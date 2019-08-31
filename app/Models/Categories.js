'use strict';

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use('Model');

class Categories extends Model {
  products() {
    return this.hasMany('App/Models/Products');
  }
}

module.exports = Categories;
