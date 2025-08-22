import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
import 'package:gym_swat/core/constants/exports.dart';
import 'package:gym_swat/features/policy/presentation/bloc/terms_conditions/terms_and_contions_bloc.dart';

class TermsAndConditionsView extends StatefulWidget {
  const TermsAndConditionsView({super.key});

  @override
  State<TermsAndConditionsView> createState() => _TermsAndConditionsViewState();
}

class _TermsAndConditionsViewState extends State<TermsAndConditionsView> {
  @override
  void initState() {
    context.read<TermsAndContionsBloc>().add(FetchedTermsAndConditions());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Terms and Conditions"),
      ),
      body: BlocBuilder<TermsAndContionsBloc, TermsAndContionsState>(
        builder: (context, state) {
          if (state is TermsAndContionsLoading) {
            return loader();
          }
          if (state is TermsAndContionsFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          if (state is TermsAndContionsLoaded) {
            final policy = state.policyEntity[0];
            return refresh(
              onRefresh: () {
                context
                    .read<TermsAndContionsBloc>()
                    .add(FetchedTermsAndConditions());
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
