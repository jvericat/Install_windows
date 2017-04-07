#START http://boxstarter.org/package/url?
#buscar fichero
$fichero="c:\opciones.txt"
if (Test-Path $fichero)
{
	$opcion=(Get-Content $fichero)[0]
	if ($opcion -eq 2)
	{
		$opciond=(Get-Content $fichero)[4]
		if ($opciond -eq 1)
		{
			#Unir a dominio
			$nombre=(Get-Content $fichero)[1]
			$user=(Get-Content $fichero)[2]
			$password=(Get-Content $fichero)[3]
			$secpasswd = ConvertTo-SecureString $password -AsPlainText -Force
			$mycreds = New-Object System.Management.Automation.PSCredential ($user, $secpasswd)
			add-computer -domainname imim.es -Credential $mycreds -ComputerName $nombre
			rm c:\opciones.txt
			Invoke-Reboot
		}
		else
		{
			$nombre=(Get-Content $fichero)[1]
			#Modificar Nombre maquina
			Rename-Computer -NewName $nombre
			$num=1
			$num | Out-File -FilePath $fichero -Append
			Invoke-Reboot
		}
	}
	else
	{
		if ($opcion -eq 1)
		{
		$user=(Get-Content $fichero)[1]
		$password=(Get-Content $fichero)[2]
		Set-ExplorerOptions -showHiddenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
		Enable-RemoteDesktop

		cinst firefox
		cinst gimp
		cinst cdburnerxp
		cinst filezilla
		cinst peazip
		cinst vlc
		cinst jre8
		cinst googlechrome
		cinst flashplayerplugin
		cinst flashplayeractivex
		cinst flashplayerppapi
		cinst adobereader
		cinst winscp
		cinst notepadplusplus
		cinst cloudstation
		cinst pdfcreator
		cinst mendeley
		cinst addtoany-chrome
		#net use M: \\folder\NTINSTALL /user:$user $password
		#copy M:\MicrosoftOffice\off.1.0.0.nupkg c:\
		#choco install c:\off.1.0.0.nupkg
		#net use M: /delete
		#rm c:\off.1.0.0.nupkg
		cinst dotnet4.5.1
		cinst powershell
		rm c:\opciones.txt
		}
	}
}
else
{
	write-output "Seleccione una opcion:"	
	
	write-output "1-Instalar software"
	write-output "2-Software i dominio"
	write-output "3-Salir"
	
	$opcion= read-host
	$opcion | Out-File -FilePath $fichero
	
	if ($opcion -eq 1)
	{
		write-output "Introduce nombre Usuario"
		$user= read-host
		$user | Out-File -FilePath $fichero -Append
		write-output "Introduce password"
		$password= read-host
		$password | Out-File -FilePath $fichero -Append

		Set-ExplorerOptions -showHiddenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
		Enable-RemoteDesktop

		cinst firefox
		cinst gimp
		cinst cdburnerxp
		cinst filezilla
		cinst peazip
		cinst vlc
		cinst jre8
		cinst googlechrome
		cinst flashplayerplugin
		cinst flashplayeractivex
		cinst flashplayerppapi
		cinst adobereader
		cinst winscp
		cinst notepadplusplus
		cinst cloudstation
		cinst pdfcreator
		cinst mendeley
		cinst addtoany-chrome
		#net use M: \\folder\NTINSTALL /user:$user $password
		#copy M:\MicrosoftOffice\off.1.0.0.nupkg c:\
		#choco install c:\off.1.0.0.nupkg
		#net use M: /delete
		#rm c:\off.1.0.0.nupkg
		cinst dotnet4.5.1
		cinst powershell
		rm c:\opciones.txt
	}
	else
	{
		if($opcion -eq 2)
		{
		
			write-output "Introduce nombre maquina"
			$nombre= read-host
			$nombre | Out-File -FilePath $fichero -Append
			write-output "Introduce nombre Usuario"
			$user= read-host
			$user | Out-File -FilePath $fichero -Append
			write-output "Introduce password"
			$password= read-host
			$password | Out-File -FilePath $fichero -Append

			Set-ExplorerOptions -showHiddenFilesFoldersDrives -showProtectedOSFiles -showFileExtensions
			Enable-RemoteDesktop

			cinst firefox
			cinst gimp
			cinst cdburnerxp
			cinst filezilla
			cinst peazip
			cinst vlc
			cinst jre8
			cinst googlechrome
			cinst flashplayerplugin
			cinst flashplayeractivex
			cinst flashplayerppapi
			cinst adobereader
			cinst winscp
			cinst notepadplusplus
			cinst cloudstation
			cinst pdfcreator
			cinst mendeley
			cinst addtoany-chrome
			#net use M: \\folder\NTINSTALL /user:$user $password
			#copy M:\MicrosoftOffice\off.1.0.0.nupkg c:\
			#choco install c:\off.1.0.0.nupkg
			#net use M: /delete
			#rm c:\off.1.0.0.nupkg
			cinst dotnet4.5.1
			cinst powershell
			Invoke-Reboot
		}
		else
		{
			if($opcion -eq 3)
			{
				rm c:\opciones.txt
			}
		}
	}
}
