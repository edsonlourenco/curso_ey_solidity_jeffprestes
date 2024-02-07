// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./owner.sol";
import "./titulo.sol";

/**
 * @title Custodia
 * @dev Armazena e controla a custodia de varios titulos do owner
 * @author Jeff Prestes
 */

//contrato: 0xf1Ba253a7645Ed52b4a4379fE5Ff8cFCC95B6513
 contract Custodia is Owner {

  address[] private titulos;

  /**
   * @dev Adiciona um titulo a custodia
   * @param titulo endereco do titulo a ser adicionado
   */
  function adicionaTitulo(address titulo) external onlyOwner {
    titulos.push(titulo);
  }

  /**
   * @dev Retorna a quantidade de titulos na custodia
   */
  function quantidadeTitulos() external view returns (uint256) {
    return titulos.length;
  }

  /**
   * @dev Retorna o endereco de um titulo na custodia
   * @param index posicao do titulo na custodia
   */
  function enderecoTitulo(uint256 index) public view returns (address) {
    return titulos[index];
  }

  /**
   * @dev Retorna dados de um titulo na custodia
   * @param index posicao do titulo na custodia
   * @return valorNominal, nomeEmissor, dataEmissao
   */
  function detalheTitulo(uint256 index) external view returns (uint256, string memory, uint256, Titulo) {
    Titulo titulo = Titulo(enderecoTitulo(index));
    return (titulo.valorNominal(), titulo.nomeEmissor(), titulo.dataEmissao(), titulo.detalhesDoTitulo());
  }
 }