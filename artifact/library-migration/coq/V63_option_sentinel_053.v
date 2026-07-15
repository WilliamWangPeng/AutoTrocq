(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_053.
Definition enc_53 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_53 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_53 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_53 : forall o : option nat, dec_53 (enc_53 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_53 : forall o : option nat, enc_53 o = size_53 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_53 : forall o : option nat, enc_53 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_053.

