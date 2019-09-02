"use strict";

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

const Companies = use("App/Models/Companies");
/**
 * Resourceful controller for interacting with empresas
 */

class EmpresaController {
  /**
   * Show a list of all empresas.
   * GET empresas
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async index({ request, response, view }) {
    const empresa = Companies.all();
    return empresa;
  }

  /**
   * Create/save a new empresa.
   * POST empresas
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async store({ request, response }) {
    try {
      const data = request.only([
        "nome_fantasia",
        "url",
        "codigo_uf",
        "codigo_cidade",
        "nome_rua",
        "bairro",
        "numero"
      ]);

      const empresa = await Companies.create(data);

      return empresa;
    } catch (error) {
      return response.send({ error: error });
    }
  }

  /**
   * Display a single empresa.
   * GET empresas/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   * @param {View} ctx.view
   */
  async show({ params, request, response, view }) {
    try {
      if (params.id) {
        const empresa = await Companies.query()
          .where("company_url", params.id)
          .orWhere("company_id", params.id)
          .fetch();
        if (empresa.rows.length > 0) {
          return empresa;
        } else {
          return response.send({ erro: true, msg: "REGISTRO_NAO_ENCONTRADO" });
        }
      }
    } catch (error) {
      console.log(error);
      return response.json(error);
    }
  }

  /**
   * Update empresa details.
   * PUT or PATCH empresas/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async update({ params, request, response }) {
    try {
      if (params.id) {
        //Primeiro pesquisa:
        const empresa = await Companies.find(params.id);

        if (empresa !== null) {
          const data = request.only([
            "nome_fantasia",
            "url",
            "codigo_uf",
            "codigo_cidade",
            "nome_rua",
            "bairro",
            "numero"
          ]);

          empresa.merge(data);

          await empresa.save();

          return empresa;
        } else {
          return response.send({ erro: true, msg: "REGISTRO_NAO_ENCONTRADO" });
        }
      } else {
        return response.send({ erro: true, msg: "ID_NAO_ESPECIFICADO" });
      }
    } catch (error) {
      console.log(error);
      return error;
    }
  }

  /**
   * Delete a empresa with id.
   * DELETE empresas/:id
   *
   * @param {object} ctx
   * @param {Request} ctx.request
   * @param {Response} ctx.response
   */
  async destroy({ params, request, response }) {
    try {
      if (params.id) {
        const empresa = await Companies.find(params.id);
        if (empresa !== null) {
          await empresa.delete();

          return empresa;
        } else {
          return response.send({ erro: true, msg: "REGISTRO_NAO_ENCONTRADO" });
        }
      }
    } catch (error) {
      return response.send(error);
    }
  }
}

module.exports = EmpresaController;
