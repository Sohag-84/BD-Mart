import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/policy/presentation/bloc/policy/policy_bloc.dart';

class PrivacyPolicyView extends StatefulWidget {
  const PrivacyPolicyView({super.key});

  @override
  State<PrivacyPolicyView> createState() => _PrivacyPolicyViewState();
}

class _PrivacyPolicyViewState extends State<PrivacyPolicyView> {
  @override
  void initState() {
    context.read<PolicyBloc>().add(FetchedPolicy());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Privacy Policy"),
      ),
      body: BlocBuilder<PolicyBloc, PolicyState>(
        builder: (context, state) {
          if (state is PolicyLoading) {
            return loader();
          }
          if (state is PolicyFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is PolicyLoaded) {
            final policy = state.policyEntity[0];
            return refresh(
              onRefresh: () {
                context.read<PolicyBloc>().add(FetchedPolicy());
              },
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: HtmlWidget(policy.content ?? ""),
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
