// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./owner.sol";
import "./titulo.sol";

/**
 * @title Recebivel
 * @dev Recebivel
 * @author Felipph Calado
 */
 contract Recebivel is Titulo, Owner {
   
    string _estabelecimentoComercial;
    string _credenciadora;
    string _arranjo;
    uint256 _dataPrevistaDeLiquidacao;
    uint256 _valor;
    uint256 immutable _dataEmissao;    
    uint8 immutable _decimais;    


    constructor() {
        _credenciadora = "Cielo S/A";
        _arranjo = "003";
        _estabelecimentoComercial = "12385952000120";
        _dataEmissao = block.timestamp;
        _valor = 5000;
        _decimais = 2;
        _dataPrevistaDeLiquidacao = _dataEmissao + 90 days;
        emit NovoPrazoPagamento(_dataEmissao, _dataPrevistaDeLiquidacao);
    }

    

    /**
     * @dev Retorna o nome da Credenciadora emissora desse recebível.
     */
    function nomeEmissor() external view returns (string memory) {
        return _credenciadora;
    }

    /**
     * @dev Retorna o arranjo do recebivel.
     */
    function arranjo() external view returns (string memory) {
        return _arranjo;
    }

    /**
     * @dev Retorna o valor nominal.
     */
    function valorNominal() external view returns (uint256) {
        return _valor;
    }

    /**
     * @dev Retorna a data da emissao.
     */
    function dataEmissao() external view returns (uint256) {
        return _dataEmissao;
    }

    /**
     * @dev Retorna a data prevista de Liquidacao
     */
    function dataPrevistaDeLiquidacao() external view returns (uint256) {
        return _dataPrevistaDeLiquidacao;
    }
    function detalhesDoTitulo() external view returns ( Titulo contrato ) {
        return this;
    }

 }
