import Killercoda

class KubeArmorPlayground(Killercoda.Playground):
    def __init__(self):
        super().__init__()

        # Install KubeArmor
        self.run_command('curl -sfL http://get.kubearmor.io/ | sudo sh -s -- -b /usr/local/bin')
        self.run_command('karmor install')

        # Deploy test Nginx app
        self.run_command('kubectl create deployment nginx --image=nginx')

        # Get Nginx pod name
        pod = self.run_command('kubectl get pod -l app=nginx -o name').decode('utf-8').strip()

        # Test KubeArmor
        self.run_command('karmor apply policy my-policy.yaml')

        # Delete Nginx app
        self.run_command('kubectl delete deployment nginx')

if __name__ == '__main__':
    KubeArmorPlayground().run()
