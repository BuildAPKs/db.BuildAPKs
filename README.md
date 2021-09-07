BuildAPKs GitHub `*NAMES` README.md

The [`build.github*.bash`](https://buildapks.github.io/buildAPKs.github/) commands use the ~/buildAPKs/var/db directory to assist in building APKs from GitHub.  The [db.BuildAPKs](https://github.com/BuildAPKs/db.BuildAPKs/) repository is this directory archived.  The git repository [db.BuildAPKs](https://github.com/BuildAPKs/db.BuildAPKs/) installs as a module into ~/buildAPKs/opt/db once https://buildapks.github.io/buildAPKs is installed.

BASH command [`build.github.bash`](https://raw.githubusercontent.com/BuildAPKs/buildAPKs.github/master/build.github.bash) can attempt to build all the APK repos in a GitHub account on device today!  When you find a GitHub username that builds with buildAPKs, consider adding to buildAPKs by submitting a [pull request](https://help.github.com/en/github/collaborating-with-issues-and-pull-requests/creating-a-pull-request) at [db.BuildAPKs/pulls](https://github.com/BuildAPKs/db.BuildAPKs/pulls) by adding to one or more of the `*NAMES` files, and to an appropriate `ma.bash` file with project source code commit reference if a project merits inclusion.

Two very simple pull requests can be submitted:  One in db.BuildAPKs by adding a name to the corresponding `*NAMES` file or files, a login name in each corresponding file per GitHub account.  The second pull request can be added in an appropriate [BuildAPKs](https://github.com/BuildAPKs) module repository by adding an `_AT_` line in the suitable ma.bash file, one line of code per project.  If a GitHub account has many interesting projects, then multiple buildAPKs module repositories can recieve pull requests regarding the same user's projects.    

1) To see the available ma.bash files you can use: 
`find ~/buildAPKs/sources/ -type f -name ma.bash -exec cat {} \;`

2) The lines concerning individual APK projects in ma.bash are: 
`grep -hr _AT_ ~/buildAPKs/sources/`

The ma.bash file usage is:  `_AT_ login/repo commit` and the file ~/buildAPKs/.gitmodules has information about each module repository.  The modules located in ~/buildAPKs/sources/ contain module themed ma.bash files.  Running ~/buildAPKs/build.buildAPKs.modules.bash will populate the `.gitmodules` file and the modules.  The `_AT_` function itself is located in `grep -r _AT_ ~/buildAPKs/scripts/` after the corresponding modules have been cloned into the ~/buildAPKs directory.

Files var/db/[BEOU]NAMES may contain duplicate names.  Depreciated file `rm.dups.bash` has more information.  

Files ~/buildAPKs/var/db/[PRXZ]NAMES may also contain duplicate names.  However, these files halt the build process.  Remove the corresponding account name from the var/db/[PRXZ]NAMES file(s) and the ~/buildAPKs/sources/github/{orgs,users}/name directory to continue to attempt to process this Github login if BuildAPKs created this directory.  Removing the corresponding ~/buildAPKs/sources/github/{orgs,users}/name directory and the name from the NAMES file(s) will continue the build process this Github login.

These files are located in ~/buildAPKs/var/db and their purpose is outlined in this table:

| File Name    | Purpose    |
| ------------ | ---------  |
| ANAMES †u    | user created listing for APK project names that will NOT be downloaded and built |
| BNAMES ∆     | login names, download size, build time, number of AndroidManifest.xml files found and APKs built that built at least 1 APK on device |
| B10NAMES ∆   | login names, download size, build time, number of AndroidManifest.xml files found and APKs built that built at least 10 APKs on device |
| B100NAMES ∆  | login names, download size, build time, number of AndroidManifest.xml files found and APKs built that built at least 100 APKs on device |
| B1KNAMES ∆   | login names, download size, build time, number of AndroidManifest.xml files found and APKs built that built at least 1000 APKs on device |
| ENAMES       | login names with exceptional APK projects |
| NUNAMES      | login names with possible new APKs that might migrate to ma.bash |
| GNAMES ∆     | login names and login type pairs |
| ONAMES       | organization names whose APKs build in buildAPKs on device |
| PNAMES †∆    | pending names that are NOT downloaded and built, but might transition to ONAMES, UNAMES and ma.bash |
| QNAMES ∆     | accounts that have at least one AndroidManifest.xml file |
| README.md    | this file |
| TNAMES       | GitHub topics that build with buildAPKs on device |
| UNAMES       | login names names that have APK projects that build with buildAPKs on device |
| XNAMES †u    | user created listing for accounts that will NOT be downloaded and built |
| YNAMES †∆    | accounts that have AndroidManifest.xml file(s), but did not build any APKs with buildAPKs |
| ZNAMES †∆    | account names that have zero APK projects |

† names and projects that are NOT built

u files for the user to edit 

∆ system files

[Awk](https://www.gnu.org/software/gawk/manual/) can be used `awk 'NR>=20 && NR<=46' ~/buildAPKs/var/db/README.md` to view the \*NAMES files table in this file.  

Pull requests to the [db.BuildAPKs](https://github.com/BuildAPKs/db.BuildAPKs/) database can be proposed [here](https://github.com/BuildAPKs/db.BuildAPKs/pulls).

This command `grep NAMES ~/buildAPKs/var/db/README.md | grep \| | awk '{print $2}' | cut -c 1 | sort | uniq` assists in maintaining the file name structure.  These database files are being developed and may contain data pair types:

| File Name    | Purpose    |
| ------------ | ---------  |
| DNAMES ∆     | login names and built date pairs |
| FNAMES ∆     | login names and build time pairs |
| GNAMES ∆     | login names and login type pairs |
| MNAMES ∆     | login names and number of AndroidManifest.xml files pairs |
| SNAMES ∆     | login names and download size pairs |
| WNAMES ∆     | login names and built APK projects pairs |

| Other Files  | Purpose    |
| ------------ | ---------  |
| mn.bash      | merge NAMES files from RDR/var/db into db.BuildAPKs |
| rm.dups.bash | Depreciated:  parses files for duplicate names |

The command `for i in $(awk '{print $6}' BNAMES) ; do j=$(($j+$i)) ; done && echo $j && unset i j` will show how many APKs can be built from the BNAMES file.

##### Some source pages for NUNAMES:
   * [https://github.com/amitshekhariitbhu/awesome-android-complete-reference](https://github.com/amitshekhariitbhu/awesome-android-complete-reference)
   * [https://github.com/ashishb/android-security-awesome](https://github.com/ashishb/android-security-awesome)
   * [https://github.com/JStumpp/awesome-android](https://github.com/JStumpp/awesome-android)
   * [https://github.com/Mybridge/amazing-android-apps](https://github.com/Mybridge/amazing-android-apps)
   * [https://github.com/Trinea/android-open-project](https://github.com/Trinea/android-open-project)
   * [https://github.com/wasabeef/awesome-android-ui](https://github.com/wasabeef/awesome-android-ui)

##### Information about shells:
   * [https://developer.ibm.com/tutorials/l-linux-shells/](https://developer.ibm.com/tutorials/l-linux-shells/)
   * [https://www.gnu.org/software/bash/manual/bash.html](https://www.gnu.org/software/bash/manual/bash.html)
   * [http://www.tldp.org/guides.html](http://www.tldp.org/guides.html)

NOTE:  Adding a token pair to ~/buildAPKs/.conf/GAUTH will increase the rate limit for authenticated users of GitHub.  You can use this OATH token configuration file to enable OAuth authentication.  To create an OAuth token, https://github.com/settings/tokens can be used.  Insert a GitHub token pair seperated by a collen `:` into the first line of file GAUTH.  File [GAUTH](https://raw.githubusercontent.com/BuildAPKs/buildAPKs/master/.conf/GAUTH) has more information.  
<!-- db.BuildAPKs README.md EOF -->
