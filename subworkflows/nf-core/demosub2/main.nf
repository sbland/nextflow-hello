

params.values = [
  "foo",
  "bar"
]

process postRun {

  publishDir "outputs/postout-names", mode: 'copy', overwrite: true

  input:
  val name

  output:
  path "${name}.txt"

  script:
  """
  touch "${name}.txt"


  """

}

workflow DEMOSUB {

    take:
    ch_input_fields

    main:

    ch_versions = Channel.empty()
    def run_out = postRun(ch_input_fields)


    emit:

    out      = run_out
    versions = ch_versions                     // channel: [ versions.yml ]
}
