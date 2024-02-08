// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./owner.sol";
import "./Titulo.sol";

 contract Debenture is Titulo, Owner {

    string _emissor;
    uint256 immutable _dataEmissao;
    uint256 _valor;
    uint8 immutable _decimais;
    uint256 _prazoPagamento;
    uint16 _fracoes;
    string public rating;


    constructor() {
        _emissor = "Empresa Energia S/A";
        _dataEmissao = block.timestamp;
        _valor = 100000000;
        _decimais = 2;
        _prazoPagamento = _dataEmissao + 90 days;
        rating = "BBB-";
        _fracoes = 1000;
        emit NovoPrazoPagamento(_dataEmissao, _prazoPagamento);
    }

 
    function valorNominal() external view returns (uint256) {
        return _valor;
    }

   
    function nomeEmissor() external view returns (string memory) {
        return _emissor;
    }

   
    function dataEmissao() external view returns (uint256) {
        return _dataEmissao;
    }


    function mudaRating(string memory novoRating) external onlyOwner returns (bool) {
        rating = novoRating;
        return true;
    }

    function alteraFracoes(uint16 fracoes_) external onlyOwner returns (bool) {
        require(fracoes_ >=100, "numero de fracoes baixo");
        _fracoes = fracoes_;
        return true;
    }

    function fracoes() external view returns (uint16) {
        return _fracoes;
    }

    function detalhesDoTitulo() external view returns ( Titulo contrato ) {
        return this;
    }

 }