(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_046.
Definition enc_46 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_46 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_46 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_46 : forall o : option nat, dec_46 (enc_46 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_46 : forall o : option nat, enc_46 o = size_46 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_46 : forall o : option nat, enc_46 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_046.

