class CnsGeretare
  def self.gerador_cns
    pis = gerador_pis
    soma = (
      (pis[0].to_i * 15) +
      (pis[1].to_i * 14) +
      (pis[2].to_i * 13) +
      (pis[3].to_i * 12) +
      (pis[4].to_i * 11) +
      (pis[5].to_i * 10) +
      (pis[6].to_i * 9) +
      (pis[7].to_i * 8) +
      (pis[8].to_i * 7) +
      (pis[9].to_i * 6) +
      (pis[10].to_i * 5)
    )
    resto = soma % 11
    dv = 11 - resto
    dv = 0 if dv == 11
    if dv == 10
      soma = (
        (pis[0].to_i * 15) +
        (pis[1].to_i * 14) +
        (pis[2].to_i * 13) +
        (pis[3].to_i * 12) +
        (pis[4].to_i * 11) +
        (pis[5].to_i * 10) +
        (pis[6].to_i * 9) +
        (pis[7].to_i * 8) +
        (pis[8].to_i * 7) +
        (pis[9].to_i * 6) +
        (pis[10].to_i * 5) + 2
      )
      resto = soma % 11
      dv = 11 - resto
    end
    dv == 10 ? "#{pis}001#{dv}" : "#{pis}000#{dv}"
  end

  def self.gerador_pis
    a = [rand(1..2), rand(10), rand(10), rand(10), rand(10), rand(10), rand(10), rand(10), rand(10), rand(10)]

    soma = (a[0] * 3) + (a[1] * 2) + (a[2] * 9) + (a[3] * 8) + (a[4] * 7) + (a[5] * 6) + (a[6] * 5) + (a[7] * 4) + (a[8] * 3) + (a[9] * 2)
    resto = soma % 11
    dv = 11 - resto

    dv = 0 if [10, 11].include?(dv)

    a.join('') + dv.to_s
  end

  def self.validate(cns)
    valida_cns(cns) || valida_cns_prov(cns)
  end

  def self.valida_cns(cns)
    return false if cns.to_s.strip.length != 15

    pis = cns[0, 11]
    soma = (0..10).sum { |i| pis[i].to_i * (15 - i) }
    resto = soma % 11
    dv = 11 - resto

    dv = 0 if dv == 11

    if dv == 10
      soma = (0..10).sum { |i| pis[i].to_i * (15 - i) } + 2
      resto = soma % 11
      dv = 11 - resto
    end

    resultado = if dv == 10
                  "#{pis}001#{dv}"
                else
                  "#{pis}000#{dv}"
                end

    cns == resultado
  end

  def self.valida_cns_prov(cns)
    return false if cns.to_s.strip.length != 15

    soma = (0..14).sum { |i| cns[i].to_i * (15 - i) }
    resto = soma % 11

    resto.zero?
  end
end
