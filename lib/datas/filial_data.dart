import 'dart:convert';

class FilialData {

    String cs;
    String ativa;
    String cnpj;
    String razaoSocial;
    String nomeFantasia;
    String tipoContribuinte;
    String inscricaoEstadual;
    String inscricaoMunicipal;
    String cep;
    String logradouro;
    String numero;
    String complemento;
    String bairro;
    String cidade;
    String uf;
    String fone;
    String celular;
    String whatsapp;
    String website;
    String facebook;
    String instagram;
    String obs;
    String regTributario;
    String aPis;
    String aCofins;
    String aCS;
    String aIR;
    String emails;
    String dataCadastro;
    String dataAtualizacao;



    FilialData();

    FilialData.fromMap(Map<String, dynamic> data) {
      cs = data['cs'];
      ativa = data['ativa'];
      cnpj = data['cnpj'];
      razaoSocial = data['razaoSocial'];
      nomeFantasia = data['nomeFantasia'];
      tipoContribuinte = data['tipoContribuinte'];
      inscricaoEstadual = data['inscricaoEstadual'];
      inscricaoMunicipal = data['inscricaoMunicipal'];
      cep = data['cep'];
      logradouro = data['logradouro'];
      numero = data['numero'];
      complemento = data['complemento'];
      bairro = data['bairro'];
      cidade = data['cidade'];
      uf = data['uf'];
      fone = data['fone'];
      celular = data['celular'];
      whatsapp = data['whatsapp'];
      website = data['website'];
      facebook = data['facebook'];
      instagram = data['instagram'];
      obs = data['obs'];
      regTributario = data['regTributario'];
      aPis = data['aPis'];
      aCofins = data['aCofins'];
      aCS = data['aCS'];
      aIR = data['aIR'];
      emails = data['emails'];
      dataCadastro = data['dataCadastro'];
      dataAtualizacao = data['dataAtualizacao'];
    }

    Map<String, dynamic> toJson() => {
    'ativa': ativa,
    'cnpj': cnpj,
    'razaoSocial': razaoSocial,
    'nomeFantasia': nomeFantasia,
    'tipoContribuinte': tipoContribuinte,
    'inscricaoEstadual': inscricaoEstadual,
    'inscricaoMunicipal': inscricaoMunicipal,
    'cep': cep,
    'logradouro': logradouro,
    'numero': numero,
    'complemento': complemento,
    'bairro': bairro,
    'cidade': cidade,
    'uf': uf,
    'fone': fone,
    'celular': celular,
    'whatsapp': whatsapp,
    'website': website,
    'facebook': facebook,
    'instagram': instagram,
    'obs': obs,
    'regTributario': regTributario,
    'aPis': aPis,
    'aCofins': aCofins,
    'aCS': aCS,
    'aIR': aIR,
    'emails': emails,
    'dataCadastro': dataCadastro,
    'dataAtualizacao': dataAtualizacao
    };

}