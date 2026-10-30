# Ejercicio 2: Cálculo de paga

function Leer-Numero {
    param(
        [string]$Mensaje,
        [double]$Maximo
    )
    while ($true) {
        # Acepta coma o punto como separador decimal
        $entrada = (Read-Host $Mensaje).Trim().Replace(',', '.')
        $valor = 0.0
        $ok = [double]::TryParse(
            $entrada,
            [System.Globalization.NumberStyles]::Float,
            [System.Globalization.CultureInfo]::InvariantCulture,
            [ref]$valor
        )
        if ($ok -and -not [double]::IsNaN($valor) -and -not [double]::IsInfinity($valor) `
            -and $valor -ge 0 -and $valor -le $Maximo) {
            return $valor
        }
        Write-Host "Valor inválido. Ingresá un número entre 0 y $Maximo (ej: 40 o 12,5)." -ForegroundColor Yellow
    }
}

$horas = Leer-Numero -Mensaje "Ingresá el número de horas trabajadas" -Maximo 744
$coste = Leer-Numero -Mensaje "Ingresá el coste por hora" -Maximo 1000000000

$paga = $horas * $coste
$pagaTxt = $paga.ToString("N2", [System.Globalization.CultureInfo]::GetCultureInfo("es-AR"))

Write-Host ('La paga que le corresponde es: $ {0}' -f $pagaTxt) -ForegroundColor Green
