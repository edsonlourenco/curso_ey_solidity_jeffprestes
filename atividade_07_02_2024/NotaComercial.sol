// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./owner.sol";
import "./Titulo.sol";


 contract NotaComercial is Titulo, Owner {

    string _emissor;
    uint256 immutable _dataEmissao;
    uint256 _valor;
    uint8 immutable _decimais;
    uint256 _prazoPagamento;

    constructor() {
        _emissor = "Distribuidora Comercial LTDA";
        _dataEmissao = block.timestamp;
        _valor = 100000000;
        _decimais = 2;
        _prazoPagamento = _dataEmissao + 90 days;
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


    function mudaDataPagamento(uint256 prazoPagamento_) external onlyOwner returns (uint256) {
        emit NovoPrazoPagamento(_prazoPagamento, _prazoPagamento + prazoPagamento_);
        _prazoPagamento = _prazoPagamento + prazoPagamento_;
        return _prazoPagamento;
    }
    function detalhesDoTitulo() external view returns ( Titulo contrato ) {
        return this;
    }

 }