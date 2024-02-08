// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Titulo
 * @dev Define funcoes de um titulo
 * @author Jeff Prestes
 */
interface Titulo {

    function valorNominal() external view returns (uint256);

    function nomeEmissor() external view returns (string memory);

    function dataEmissao() external view returns (uint256);

    event NovoPrazoPagamento(uint256 prazoAntigo, uint256 prazoNovo);

    function detalhesDoTitulo() external view returns ( Titulo contrato );

}