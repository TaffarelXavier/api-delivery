'use strict';

/** @typedef {import('@adonisjs/framework/src/Request')} Request */
/** @typedef {import('@adonisjs/framework/src/Response')} Response */
/** @typedef {import('@adonisjs/framework/src/View')} View */

const Companies = use('App/Models/Companies');
/**
 * Resourceful controller for interacting with empresas
 */

class EmpresaController {
  /**
   * @swagger
   * /companies:
   *   get:
   *     tags:
   *       - Company
   *     summary: Return all companies.
   *     responses:
   *       200:
   *         description: Return all list of companies
   *         example:
   *           message: An Array
   */
  async index({ request, response, view }) {
    const empresa = Companies.all();
    return empresa;
  }

  /**
   * @swagger
   * /companies:
   *   post:
   *     tags:
   *       - Company
   *     summary: Create/save a new empresa.
   *     description:  Create/save a new empresa, etc.
   *     parameters:
   *     - in: query
   *       name: offset
   *       schema:
   *         type: integer
   *       description: The number of items to skip before starting to collect the result set
   *     - in: query
   *       name: limit
   *       schema:
   *         type: integer
   *       description: The numbers of items to return
   *     responses:
   *       200:
   *         description: Return all list of companies
   *         example:
   *           message: An Array
   */

  async store({ request, response }) {
    try {
      const data = request.only(['nome_fantasia', 'url', 'codigo_uf', 'codigo_cidade', 'nome_rua', 'bairro', 'numero']);

      const empresa = await Companies.create(data);

      return empresa;
    } catch (error) {
      return response.send({ error: error });
    }
  }
    /**
   * @swagger
   * /companies/:id:
   *   get:
   *     tags:
   *       - Company
   *     summary: Return a company by your id.
   *     responses:
   *       200:
   *         description: Return all list of companies
   *         example:
   *           message: An Array
   */
  async show({ params, request, response, view }) {
    try {
      if (params.id) {
        const empresa = await Companies.query()
          .where('company_url', params.id)
          .orWhere('company_id', params.id)
          .fetch();
        if (empresa.rows.length > 0) {
          return empresa;
        } else {
          return response.send({ erro: true, msg: 'REGISTRO_NAO_ENCONTRADO' });
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
            'nome_fantasia',
            'url',
            'codigo_uf',
            'codigo_cidade',
            'nome_rua',
            'bairro',
            'numero',
          ]);

          empresa.merge(data);

          await empresa.save();

          return empresa;
        } else {
          return response.send({ erro: true, msg: 'REGISTRO_NAO_ENCONTRADO' });
        }
      } else {
        return response.send({ erro: true, msg: 'ID_NAO_ESPECIFICADO' });
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
          return response.send({ erro: true, msg: 'REGISTRO_NAO_ENCONTRADO' });
        }
      }
    } catch (error) {
      return response.send(error);
    }
  }
}

module.exports = EmpresaController;
