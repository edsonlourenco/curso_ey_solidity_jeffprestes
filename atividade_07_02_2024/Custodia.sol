// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

import "./owner.sol";
import "./Titulo.sol";

/**
    ----> Endereco da custodia aqui: 0x01c5dF18C922d822c007E004ebDA945A8a342A0e
*/
contract Custodia is Owner {
    address[] private titulos;


    function adicionaTitulo(address titulo) external onlyOwner {
        titulos.push(titulo);
    }


    function quantidadeTitulos() external view returns (uint256) {
        return titulos.length;
    }


    function enderecoTitulo(uint256 index) public view returns (address) {
        return titulos[index];
    }


    function detalheTitulo(uint256 index)
        external
        view
        returns (
            uint256,
            string memory,
            uint256,
            Titulo
        )
    {
        Titulo titulo = Titulo(enderecoTitulo(index));
        return (
            titulo.valorNominal(),
            titulo.nomeEmissor(),
            titulo.dataEmissao(),
            titulo.detalhesDoTitulo()
        );
    }
}
