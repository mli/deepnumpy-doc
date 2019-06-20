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
      pip install https://s3-us-west-2.amazonaws.com/apache-mxnet/dist/python/numpy/20190619/mxnet-1.5.0b20190619-py2.py3-none-manylinux1_x86_64.whl
      pip install git+https://github.com/d2l-ai/d2l-book
      pip list
      """

      sh label:"Build HTML", script:"""set -ex
      conda activate ${ENV_NAME}
      d2lbook build html
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
