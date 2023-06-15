# rl-scanner-action

## Inputs
    inputs:
      artifact-to-scan:
        description: 'The file artifact we will be scanning (a file path relative to the github.workspace)'
        required: true
      ref-sha:
        description: 'the commit or pr sha'
        required: false
        default: ${{ github.event.pull_request.head.sha || github.sha }}
      report-path:
        description: 'the path of the directory we will create to put the report in, must be empty, all data will be removed from this dir, is relative to github.workspace'
        required: false
        default: MyReportDir

## Ouputs
    outputs:
      description:
        description: 'The result of the action: a string terminating in FAIL or PASS'
        value: ${{ steps.scan.outputs.description }}
      status:
        description: 'The single word result of the action: success, failure or error'
        value: ${{ steps.scan.outputs.status }}

## in a composite action we do:

* set the status to pending
* run the reversinglabs/rl-scanner with the provided artifact we must scan
* upload the report as artifact
* Upload the SARIF file
* show a proper status based on the scan result
* return a proper exit status so the caller knows what to do

## Licence
Licence information needs to be passed as environment variables as is required for reversinglabs/rl-scanner

* RLSECURE_ENCODED_LICENSE
* RLSECURE_SITE_KEY

## References
 * [reversinglabs/rl-scanner Docker](https://hub.docker.com/repository/docker/reversinglabs/rl-scanner/)
