"use strict";

/** @type {typeof import('@adonisjs/lucid/src/Lucid/Model')} */
const Model = use("Model");

class City extends Model {
  static get primaryKey() {
    return "city_id";
  }
}

module.exports = City;