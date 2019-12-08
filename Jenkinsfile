stage("Build and Publish") {
  def TASK = "numpy-api-doc"
  node {
    ws("workspace/${TASK}") {
      checkout scm
      def ENV_NAME = "${TASK}-${EXECUTOR_NUMBER}";

      sh label: "Build Environment", script: """set -ex
      rm -rf ~/miniconda3/envs/${ENV_NAME}
      conda create -n ${ENV_NAME} pip -y
      conda activate ${ENV_NAME}
      pip install mxnet-cu101==1.6.0b20191122
      pip install git+https://github.com/d2l-ai/d2l-book@f26c20923edd4fb9fe9e6eb6e8d4b8976e41c22a
      pip install matplotlib
      pip list
      """

      sh label:"Build HTML", script:"""set -ex
      conda activate ${ENV_NAME}
      ./build_html.sh
      """

      if (env.BRANCH_NAME == 'master') {
        sh label:"Publish", script:"""set -ex
        conda activate ${ENV_NAME}
        d2lbook deploy html
      """
      }
	}
  }
}
