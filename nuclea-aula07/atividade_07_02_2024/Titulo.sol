// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

/**
 * @title Titulo
 * @dev Define funcoes de um titulo
 * @author Jeff Prestes
 */
interface Titulo {

    /**
     * @dev Retorna o valor nominal.
     */
    function valorNominal() external view returns (uint256);

    /**
     * @dev Retorna o nome do Emissor.
     */
    function nomeEmissor() external view returns (string memory);

    /**
     * @dev Retorna a data da emissao.
     */
    function dataEmissao() external view returns (uint256);

    /**
     * @dev Emitido quando um novo prazo de pagamento é definido
     */
    event NovoPrazoPagamento(uint256 prazoAntigo, uint256 prazoNovo);

    function detalhesDoTitulo() external view returns ( Titulo contrato );

}